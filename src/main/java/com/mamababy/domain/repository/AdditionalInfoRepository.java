package com.mamababy.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamababy.domain.user.AdditionalInfo;

public interface AdditionalInfoRepository extends
		JpaRepository<AdditionalInfo, Long> {

}
