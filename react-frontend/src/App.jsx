import { useEffect, useState } from "react";
import {
  applyForJob,
  getApplications,
  getJobs,
  loginUser,
  registerUser
} from "./api";

const emptyRegister = {
  name: "",
  email: "",
  password: "",
  skills: ""
};

function App() {
  const [user, setUser] = useState(() => {
    const saved = localStorage.getItem("jobportal-user");
    return saved ? JSON.parse(saved) : null;
  });
  const [page, setPage] = useState("jobs");
  const [jobs, setJobs] = useState([]);
  const [applications, setApplications] = useState([]);
  const [login, setLogin] = useState({ email: "", password: "" });
  const [register, setRegister] = useState(emptyRegister);
  const [message, setMessage] = useState("");
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (user) loadJobs();
  }, [user]);

  async function loadJobs() {
    try {
      setLoading(true);
      setJobs(await getJobs(user.userId));
    } catch (error) {
      setMessage(error.message);
    } finally {
      setLoading(false);
    }
  }

  async function submitLogin(event) {
    event.preventDefault();
    try {
      const data = await loginUser(login);
      localStorage.setItem("jobportal-user", JSON.stringify(data));
      setUser(data);
      setMessage("Login successful");
    } catch (error) {
      setMessage(error.message);
    }
  }

  async function submitRegister(event) {
    event.preventDefault();
    try {
      await registerUser(register);
      setRegister(emptyRegister);
      setPage("login");
      setMessage("Registration successful. Please log in.");
    } catch (error) {
      setMessage(error.message);
    }
  }

  async function apply(jobId) {
    try {
      await applyForJob(user.userId, jobId);
      setMessage("Application submitted");
    } catch (error) {
      setMessage(error.message);
    }
  }

  async function showApplications() {
    try {
      setApplications(await getApplications());
      setPage("applications");
    } catch (error) {
      setMessage(error.message);
    }
  }

  function logout() {
    localStorage.removeItem("jobportal-user");
    setUser(null);
    setPage("login");
    setMessage("");
  }

  if (!user) {
    return (
      <main className="auth-shell">
        <section className="auth-card">
          <div className="brand">JobPortal</div>
          {page === "login" ? (
            <>
              <h1>Find your next opportunity</h1>
              <p>Sign in to discover jobs matched to your skills.</p>
              <form onSubmit={submitLogin}>
                <input
                  type="email"
                  placeholder="Email"
                  value={login.email}
                  onChange={(e) => setLogin({ ...login, email: e.target.value })}
                  required
                />
                <input
                  type="password"
                  placeholder="Password"
                  value={login.password}
                  onChange={(e) => setLogin({ ...login, password: e.target.value })}
                  required
                />
                <button>Sign in</button>
              </form>
              <button className="link-button" onClick={() => setPage("register")}>
                Create an account
              </button>
            </>
          ) : (
            <>
              <h1>Create your account</h1>
              <p>Build a profile and receive skill-based job matches.</p>
              <form onSubmit={submitRegister}>
                <input
                  placeholder="Full name"
                  value={register.name}
                  onChange={(e) => setRegister({ ...register, name: e.target.value })}
                  required
                />
                <input
                  type="email"
                  placeholder="Email"
                  value={register.email}
                  onChange={(e) => setRegister({ ...register, email: e.target.value })}
                  required
                />
                <input
                  type="password"
                  placeholder="Password"
                  value={register.password}
                  onChange={(e) => setRegister({ ...register, password: e.target.value })}
                  required
                />
                <input
                  placeholder="Skills (Java, React, SQL)"
                  value={register.skills}
                  onChange={(e) => setRegister({ ...register, skills: e.target.value })}
                  required
                />
                <button>Create account</button>
              </form>
              <button className="link-button" onClick={() => setPage("login")}>
                Back to sign in
              </button>
            </>
          )}
          {message && <div className="message">{message}</div>}
        </section>
      </main>
    );
  }

  return (
    <div className="app-shell">
      <header>
        <div>
          <div className="brand">JobPortal</div>
          <span>Welcome, {user.name}</span>
        </div>
        <nav>
          <button onClick={() => { setPage("jobs"); loadJobs(); }}>Jobs</button>
          <button onClick={showApplications}>Applications</button>
          <button className="logout" onClick={logout}>Logout</button>
        </nav>
      </header>

      <main className="content">
        {message && <div className="message">{message}</div>}

        {page === "jobs" && (
          <>
            <section className="hero">
              <span>Skill-based matching</span>
              <h1>Recommended jobs for you</h1>
              <p>Explore roles based on the skills in your profile.</p>
            </section>

            {loading ? (
              <div className="empty">Loading jobs...</div>
            ) : (
              <section className="job-grid">
                {jobs.map((job) => (
                  <article className="job-card" key={job.id}>
                    <div className="match">{job.match}% match</div>
                    <h2>{job.title}</h2>
                    <p className="company">{job.company}</p>
                    <p>{job.skills}</p>
                    <button onClick={() => apply(job.id)}>Apply now</button>
                  </article>
                ))}
              </section>
            )}
          </>
        )}

        {page === "applications" && (
          <section className="panel">
            <h1>Applications</h1>
            {applications.length === 0 ? (
              <div className="empty">No applications yet.</div>
            ) : (
              <div className="table-wrap">
                <table>
                  <thead>
                    <tr>
                      <th>Candidate</th>
                      <th>Job</th>
                      <th>Company</th>
                      <th>Applied</th>
                    </tr>
                  </thead>
                  <tbody>
                    {applications.map((application) => (
                      <tr key={application.id}>
                        <td>{application.user.name}</td>
                        <td>{application.job.title}</td>
                        <td>{application.job.company}</td>
                        <td>{new Date(application.appliedDate).toLocaleString()}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </section>
        )}
      </main>
    </div>
  );
}

export default App;