/**
 * Validates if a bucket name follows proper formatting.
 *
 * @param {string | string[] | {label: string; required: boolean }} field The input field.
 *
 * @returns {Promise<string>} An error message or `"success"`
 */
export default async (field) => {
  if (typeof field !== "string") {
    return "Field type is not supported by validator";
  }

  if (field.length > 63 || field.length < 3) {
    return "Bucket name must be between 3 and 63 characters";
  }

  if (!/^[a-z0-9][a-z0-9-]*[a-z0-9]$/.test(field)) {
    return "Bucket name must start and end with a lowercase letter or number, and can only contain lowercase letters, numbers, and hyphens";
  }

  return "success";
}
