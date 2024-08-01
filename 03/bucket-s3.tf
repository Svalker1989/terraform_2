// Создание сервисного аккаунта
resource "yandex_iam_service_account" "bucket-sa" {
  name = "bucket-sa"
}

// Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-admin" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.bucket-sa.id}"
}

// Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.bucket-sa.id
  description        = "static access key for object storage"
}

// Создание бакета с использованием ключа
resource "yandex_storage_bucket" "str-bucket" {
  access_key            = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key            = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.str-key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
  bucket                = "str-bucket"
  max_size              = "1048576"
  default_storage_class = "STANDARD"
}
// создаем KMS
resource "yandex_kms_symmetric_key" "str-key" {
  name              = "str-key"
  description       = "s3 bucket key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // 1 год
}

resource "yandex_storage_object" "img-object" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "str-bucket"
  key        = "img.png"
  source     = "./img.png"
}