package com.mamababy.domain.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mamababy.domain.Board.Bbs;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public interface BbsRepository extends JpaRepository<Bbs, Long>,JpaSpecificationExecutor<Bbs> {

	@Override
	Bbs save(Bbs bbs);

	@Query("UPDATE com.mamababy.domain.Board.Bbs SET hit=hit+1 where no=:no")
	void increseHit(@Param("no") String no);

	@Query("SELECT count(id) from com.mamababy.domain.Board.Bbs b where category=:cate")
	String findArticleCntByCategory(@Param("cate") String category);

	Page<Bbs> findByCategory(String category, Pageable pagerequest);

	Bbs findById(String id);

	// @Query("select subject, name, content, reg_date, no, category from bbs where category=:cate ORDER BY no DESC LIMIT  :pageNo,3")
	// public List<Bbs> findByPabNoBbslistBycate(@Param("cate") String category,
	// @Param("pageNo")int pageNo);
	//

}
