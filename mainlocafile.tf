provider "local" {

}
resource "local_file" "hello" {
content  = "hello"
filename = "/tmp/test1.txt"
}