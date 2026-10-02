package com.jobportal.dto;

import java.time.LocalDateTime;

public record ApplicationResponse(
    Integer id,
    String name,
    String email,
    String title,
    String company,
    LocalDateTime appliedDate
) {}