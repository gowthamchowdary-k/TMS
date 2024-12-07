package com.klu.TMS.repository;

import com.klu.TMS.model.hotelbooking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface hotelbookingRepository extends JpaRepository<hotelbooking, Long> {
    // You can define custom query methods here if needed.
}
