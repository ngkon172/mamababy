package com.mamababy.domain.Board;

import java.util.List;

public interface BbsDao {

	// Long save(Bbs b);
	// void delete(Bbs b);
	// void update(Bbs b);
	// Bbs findById(Long id);
	// List<Bbs> listAll();

	List<Bbs> listAll(int pageNum);

}
