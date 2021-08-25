package main

import (
	"fmt"
	"os"

	git "github.com/go-git/go-git/v5"
    . "github.com/go-git/go-git/v5/_examples"
	"github.com/go-git/go-git/v5/plumbing/transport/http"
)

func clone_repo() {
    fmt.Println("Cloning repo...")

    CheckArgs("<repo_url>", "<kustomize_path>", "<directory>", "<github_access_token>")
	url, _, directory, token := os.Args[1], os.Args[2], os.Args[3], os.Args[4]

	Info("git clone %s %s", url, directory)

	r, err := git.PlainClone(directory, false, &git.CloneOptions{
		Auth: &http.BasicAuth{
			Username: "ci-tool",
			Password: token,
		},
		URL:      url,
		Progress: os.Stdout,
	})
	CheckIfError(err)

	_, err = r.Head()
	CheckIfError(err)

    fmt.Println("")
}

func update_kustomize_image() {
    fmt.Println("Updating kustomize image...")
    fmt.Println("")
}

func push_repo() {
    fmt.Println("Pushing repo...")
    fmt.Println("")
}

func main() {
    clone_repo()
    update_kustomize_image()
    push_repo()
}
