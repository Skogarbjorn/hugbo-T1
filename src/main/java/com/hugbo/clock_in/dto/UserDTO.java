package com.hugbo.clock_in.dto;

import com.hugbo.clock_in.domain.entity.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * UserDTO
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDTO {
    private String name;
    private String email;
    private String password;

    public static UserDTO fromEntity(User user) {
        return new UserDTO(user.getName(), user.getEmail(), null);
    }
}
