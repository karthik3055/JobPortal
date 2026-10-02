package com.jobportal.controller;

import com.jobportal.dto.JobResponse;
import com.jobportal.model.User;
import com.jobportal.repository.JobRepository;
import com.jobportal.repository.UserRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/jobs")
@CrossOrigin
public class JobController {
    private final JobRepository jobs;
    private final UserRepository users;

    public JobController(JobRepository jobs, UserRepository users) {
        this.jobs = jobs;
        this.users = users;
    }

    @GetMapping
    public List<JobResponse> getJobs(@RequestParam Integer userId) {
        User user = users.findById(userId).orElseThrow();

        return jobs.findAll().stream()
                .map(job -> new JobResponse(
                        job.getId(),
                        job.getTitle(),
                        job.getCompany(),
                        job.getSkills(),
                        calculateMatch(user.getSkills(), job.getSkills())))
                .toList();
    }

    private int calculateMatch(String userSkills, String jobSkills) {
        if (userSkills == null || userSkills.isBlank() || jobSkills == null || jobSkills.isBlank()) {
            return 0;
        }

        String[] mine = userSkills.toLowerCase().split(",");
        String[] required = jobSkills.toLowerCase().split(",");
        int matched = 0;

        for (String requiredSkill : required) {
            for (String userSkill : mine) {
                if (requiredSkill.trim().equals(userSkill.trim())) {
                    matched++;
                    break;
                }
            }
        }

        return matched * 100 / required.length;
    }
}