package com.mamababy.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamababy.domain.user.Item;

public interface productRepostiory extends JpaRepository<Item, Long> {

}
