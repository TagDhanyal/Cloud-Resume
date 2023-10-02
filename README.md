## My Cloud Resume Challenge

I built this project to showcase my skills in cloud computing and web development. It is a static web page hosted on AWS S3 Using Cloudfront as the CDN, and I used Terraform to create and manage the infrastructure, and GitHub Actions to automate the deployment process.

You can view my resume here: [link to resume website will have my github actions update this]

### Dev branch workflow

1. I create a new branch from the `main` branch.
2. I make my changes to the website code.
3. I push my changes to the dev branch.
4. I create a pull request to merge the dev branch into the `main` branch.
5. Once the pull request is approved and merged, the changes are deployed to production.

### Main branch workflow

1. I push my changes to the `main` branch.
2. GitHub Actions triggers a workflow to deploy the changes to production.

### AWS Services diagram

[Image of the AWS Services diagram](https://user-images.githubusercontent.com/98762800/156835852-d4388868-afae-4ee7-91a6-139b3372e9c5.png)

### Additional notes

* I use the `dev` branch to develop and test my changes before merging them into the `main` branch.
* I use pull requests to get feedback on my changes and to ensure that they are ready to be deployed to production.
* I use GitHub Actions to automate the deployment process, so that I don't have to manually deploy my changes to production.
