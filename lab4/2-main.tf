# 壓縮檔案
resource "archive_file" "init" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/generated/main_py.zip"
}

# 生成亂數命名gcs
resource "random_uuid" "test" {
}

# 自動啟用必要的 GCP API
resource "google_project_service" "required_apis" {
  for_each = toset([
    "cloudfunctions.googleapis.com",
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com",
    "storage.googleapis.com"
  ])

  project            = var.GCP_PROJECT
  service            = each.key
  disable_on_destroy = false # 防止 terraform destroy 時意外關閉重要 API
}


# gcf 生成
resource "google_storage_bucket" "bucket" {
  name                        = "gcf-source-${random_uuid.test.result}"
  location                    = "asia" # GCS 儲存桶區域
  uniform_bucket_level_access = true
  force_destroy               = true # 測試時方便 terraform destroy 連帶刪除 bucket 內的物件
}

resource "google_storage_bucket_object" "object" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.bucket.name
  source = "${path.module}/generated/main_py.zip"
}

resource "google_cloudfunctions2_function" "function" {
  name        = var.function_name
  location    = var.REGION
  description = "hello world function (parameterized)"

  build_config {
    runtime     = var.runtime
    entry_point = var.entry_point
    source {
      storage_source {
        bucket = google_storage_bucket.bucket.name
        object = google_storage_bucket_object.object.name
      }
    }
  }

  service_config {
    available_memory = var.available_memory
    timeout_seconds  = var.timeout_seconds
    available_cpu = var.available_cpu
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  project  = google_cloudfunctions2_function.function.project
  location = google_cloudfunctions2_function.function.location
  service  = google_cloudfunctions2_function.function.name  # CF Gen2 的 Cloud Run 服務名稱與 Function 同名
  role     = "roles/run.invoker"
  member   = "allUsers"
}
