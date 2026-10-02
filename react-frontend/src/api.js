const API_URL = "http://localhost:8080/api";

async function request(url, options = {}) {
  const response = await fetch(API_URL + url, {
    headers: {
      "Content-Type": "application/json",
      ...(options.headers || {})
    },
    ...options
  });

  const data = await response.text();

  if (!response.ok) {
    throw new Error(data || "Request failed");
  }

  try {
    return JSON.parse(data);
  } catch {
    return data;
  }
}

export function registerUser(user) {
  return request("/auth/register", {
    method: "POST",
    body: JSON.stringify(user)
  });
}

export function loginUser(credentials) {
  return request("/auth/login", {
    method: "POST",
    body: JSON.stringify(credentials)
  });
}

export function getJobs(userId) {
  return request("/jobs?userId=" + userId);
}

export function applyForJob(userId, jobId) {
  return request("/applications?userId=" + userId + "&jobId=" + jobId, {
    method: "POST"
  });
}

export function getApplications() {
  return request("/applications");
}