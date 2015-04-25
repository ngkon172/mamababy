package com.mamababy.domain.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamababy.domain.user.Reply;

public interface replyRepository extends JpaRepository<Reply, Long>{
	
	List<Reply> findByBbsId(String id);
	Long countByBbsId(String id);

}
