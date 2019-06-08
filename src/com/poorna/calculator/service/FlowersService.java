package com.poorna.calculator.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poorna.calculator.dao.FlowersDAO;
import com.poorna.calculator.model.Flowers;

@Service("FlowersService")
public class FlowersService {

	@Autowired
	FlowersDAO FlowersDao;
	
	@Transactional
	public List<Flowers> getAllFlowers() {
		return FlowersDao.getAllFlowers();
	}

	@Transactional
	public Flowers getFlowers(int id) {
		return FlowersDao.getFlowers(id);
	}

	@Transactional
	public void addFlowers(Flowers Flowers) {
		FlowersDao.addFlowers(Flowers);
	}

	@Transactional
	public void updateFlowers(Flowers Flowers) {
		FlowersDao.updateFlowers(Flowers);

	}

	@Transactional
	public void deleteFlowers(int id) {
		FlowersDao.deleteFlowers(id);
	}
}
