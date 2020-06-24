package com.poorna.calculator.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.poorna.calculator.model.Flowers;
import com.poorna.calculator.service.FlowersService;

@RestController
public class FlowersController {
	//test
	@Autowired
	FlowersService FlowersService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		
		ModelAndView mv=new ModelAndView("angularJSCrudExample");
		
		
		return mv;
	}

	
	@RequestMapping(value = "/getAllFlowers", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<Flowers> getCountries() {
		
		List<Flowers> listOfFlowers = FlowersService.getAllFlowers();
		return listOfFlowers;
	}

	@RequestMapping(value = "/getFlowers/{id}", method = RequestMethod.GET,headers = "Accept=application/json")
	public Flowers getFlowersById(@PathVariable ("id")int id) {
		return FlowersService.getFlowers(id);
	}

	@RequestMapping(value = "/addFlowers", method = RequestMethod.POST, headers = "Accept=application/json")
	public void addFlowers(@RequestBody Flowers Flowers) {	
		FlowersService.addFlowers(Flowers);
		
	}

	@RequestMapping(value = "/updateFlowers", method = RequestMethod.PUT, headers = "Accept=application/json")
	public void updateFlowers(@RequestBody Flowers Flowers) {
		FlowersService.updateFlowers(Flowers);
	}

	@RequestMapping(value = "/deleteFlowers/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
	public void deleteFlowers(@PathVariable("id") int id) {
		FlowersService.deleteFlowers(id);		
	}	
}
