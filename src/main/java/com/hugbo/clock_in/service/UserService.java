package com.hugbo.clock_in.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hugbo.clock_in.domain.entity.User;
import com.hugbo.clock_in.dto.UserDTO;
import com.hugbo.clock_in.repository.UserRepository;

/**
 * UserService
 */
@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<UserDTO> getAllUsers() {
        return userRepository.findAll()
            .stream()
            .map(UserDTO::fromEntity)
            .toList();
    }

    public UserDTO registerUser(UserDTO dto) {
        User user = new User(null, dto.getName(), dto.getEmail(), dto.getPassword(), null, null);
        user = userRepository.save(user);
        return UserDTO.fromEntity(user);
    }
}
