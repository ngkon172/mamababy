package com.mamababy.domain.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamababy.domain.user.Reply;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Repository
@Transactional
public interface replyRepository extends CrudRepository<Reply, Long> {
	
	List<Reply> findByBbsId(String id);
	Long countByBbsId(String id);
//	Long removeById(String id);
	public void deleteById(String id);
	Reply findById(String id);
}
