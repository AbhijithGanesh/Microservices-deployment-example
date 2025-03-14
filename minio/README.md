# Using Minio as a Simulated Replacement for the Frontend Static Folder

The frontend service in the demo traditionally relies on a local `static` folder to serve assets like images, CSS, and JavaScript files. In this project, Minio is utilized as a simulated replacement for this static folder, leveraging its S3-compatible API to store and serve these assets more flexibly.

## How It Works

1. **Minio Deployment:**

   - **StatefulSet Management:** Minio is deployed as a StatefulSet, ensuring a stable network identity and persistent storage.
   - **Persistent Volume Claim (PVC):** The StatefulSet is linked to its own PVC, which guarantees data persistence and durability for your static assets.
   - **Configuration:** It is configured with its own endpoint, access key, and secret key to ensure secure access.

2. **Uploading Static Assets:**

   - **Asset Management:** Instead of storing static files locally, assets are uploaded to a designated bucket in Minio.
   - **Automation:** A CI/CD pipeline or initialization script can automate this upload process, ensuring that any changes in static content are promptly reflected in the bucket.
