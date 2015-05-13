package com.mamababy.domain.repository;

import com.mamababy.domain.user.Users;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by hoy on 15. 4. 24..
 */
public interface UserRepository  extends JpaRepository<Users, Long>{

        Users findByUser(String user);

        int countByUser(String user);
}
