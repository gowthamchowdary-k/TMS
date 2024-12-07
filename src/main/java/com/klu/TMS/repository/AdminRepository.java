package com.klu.TMS.repository;

import com.klu.TMS.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Admin, String> {
    Admin findByUsername(String username);
}
