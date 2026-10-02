package com.jobportal.controller;

import com.jobportal.dto.ApplicationResponse;
import com.jobportal.model.Application;
import com.jobportal.model.Job;
import com.jobportal.model.User;
import com.jobportal.repository.ApplicationRepository;
import com.jobportal.repository.JobRepository;
import com.jobportal.repository.UserRepository;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/applications")
@CrossOrigin(origins = "http://localhost:5173")
public class ApplicationController {
    private final ApplicationRepository applications;
    private final UserRepository users;
    private final JobRepository jobs;

    public ApplicationController(ApplicationRepository applications, UserRepository users, JobRepository jobs) {
        this.applications = applications;
        this.users = users;
        this.jobs = jobs;
    }

    @PostMapping
    public ResponseEntity<?> apply(@RequestParam Integer userId, @RequestParam Integer jobId) {
        if (applications.existsByUserIdAndJobId(userId, jobId)) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Already applied for this job");
        }

        User user = users.findById(userId).orElse(null);
        Job job = jobs.findById(jobId).orElse(null);

        if (user == null || job == null) {
            return ResponseEntity.notFound().build();
        }

        Application application = new Application();
        application.setUser(user);
        application.setJob(job);
        applications.save(application);

        return ResponseEntity.status(HttpStatus.CREATED).body("Application submitted");
    }

    @GetMapping
    public List<ApplicationResponse> getApplications() {
        return applications.findAllByOrderByAppliedDateDesc().stream()
            .map(application -> new ApplicationResponse(
                application.getId(),
                application.getUser().getName(),
                application.getUser().getEmail(),
                application.getJob().getTitle(),
                application.getJob().getCompany(),
                application.getAppliedDate()
            ))
            .toList();
    }
}