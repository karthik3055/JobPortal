package com.jobportal.controller;

import com.jobportal.model.Application;
import com.jobportal.model.Job;
import com.jobportal.model.User;
import com.jobportal.repository.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/applications")
@CrossOrigin
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
    public List<Application> getApplications() {
        return applications.findAllByOrderByAppliedDateDesc();
    }
}