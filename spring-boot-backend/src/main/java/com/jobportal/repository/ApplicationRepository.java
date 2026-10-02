package com.jobportal.repository;

import com.jobportal.model.Application;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ApplicationRepository extends JpaRepository<Application, Integer> {
    boolean existsByUserIdAndJobId(Integer userId, Integer jobId);
    List<Application> findAllByOrderByAppliedDateDesc();
}