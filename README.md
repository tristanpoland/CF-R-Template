# Deployment Guide: R Test App for Cloud Foundry

This guide explains how to deploy the R test app to Cloud Foundry.

## Prerequisites

1. Cloud Foundry CLI installed
2. Access to a Cloud Foundry environment
3. R buildpack available in your Cloud Foundry environment

## Files Included

- `app.R`: Main Shiny application
- `manifest.yml`: Cloud Foundry deployment configuration
- `start.R`: Startup script for Cloud Foundry

## Deployment Steps

1. Clone or download this repository to your local machine
2. Open a terminal and navigate to the project directory
3. Log in to your Cloud Foundry environment:
   ```
   cf login -a <API_ENDPOINT> -o <ORG> -s <SPACE>
   ```
4. Deploy the application:
   ```
   cf push
   ```
5. Once deployment is complete, you can access your application at the provided URL

## Customizing the Application

- Modify `app.R` to change the application's functionality
- Adjust memory and instance settings in `manifest.yml` based on your requirements

## Troubleshooting

If you encounter issues during deployment:

1. Check the logs:
   ```
   cf logs r-test-app --recent
   ```
2. Verify that the R buildpack is available:
   ```
   cf buildpacks
   ```
3. Make sure the required memory allocation is sufficient

## Note

This is a simple test application. For production use, consider adding:
- Error handling
- Persistent storage
- Authentication mechanisms
- Additional R packages based on your needs