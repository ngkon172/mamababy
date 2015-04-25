package com.mamababy.domain.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

import com.mamababy.domain.user.Item;

@Component
public interface ItemRepository extends JpaRepository<Item, Long>{
	
	Item findById(String id);
	List<Item> findByCategory1(String cate1);
	@Query("SELECT i From Item i where category1= (:cate1) AND category2=(:cate2)")
	List<Item>findByCategory(@Param("cate1") String cate1, @Param("cate2") String cate2);
	

}
