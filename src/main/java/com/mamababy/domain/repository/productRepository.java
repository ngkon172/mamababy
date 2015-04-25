package com.mamababy.domain.repository;

import com.mamababy.domain.user.Item;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by hoy on 15. 4. 24..
 */
public interface productRepository extends JpaRepository <Item, Long> {
}
