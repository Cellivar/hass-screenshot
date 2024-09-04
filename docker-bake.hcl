variable "registry" {
  default = "docker.squeak.house"
}

variable "hass-screenshot-tag" {
  default = "1.0.6"
}

target "hass-screenshot" {
  context = "."
  platforms = ["linux/arm64", "linux/amd64"]

  output = [
    "type=image,push=true,name=${registry}/cellivar/hass-screenshot:latest",
    "type=image,push=true,name=${registry}/cellivar/hass-screenshot:${hass-screenshot-tag}"
  ]
}

group "default" {
  targets = ["hass-screenshot"]
}
