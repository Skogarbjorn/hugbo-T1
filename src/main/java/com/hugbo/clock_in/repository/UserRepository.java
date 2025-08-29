package com.hugbo.clock_in.repository;

import org.springframework.stereotype.Repository;

import com.hugbo.clock_in.domain.entity.User;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * UserRepository
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
}
