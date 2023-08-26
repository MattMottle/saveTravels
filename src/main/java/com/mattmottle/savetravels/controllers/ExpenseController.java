package com.mattmottle.savetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mattmottle.savetravels.models.Expense;
import com.mattmottle.savetravels.services.ExpenseService;

import jakarta.validation.Valid;

@Controller
public class ExpenseController {
	@Autowired
	private ExpenseService expenseService;
	
	@GetMapping("/")
	public String home(Model model, @ModelAttribute("expense") Expense expense) {
		List<Expense> expenses = expenseService.readAllExpenses();
	     model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	
	@PostMapping("/process")
	public String addExpenseToDatabase(Model model, @Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) { 
			List<Expense> expenses = expenseService.readAllExpenses();
		     model.addAttribute("expenses", expenses);
			return "index.jsp"; 
		} 
		else {
			expenseService.createExpense(expense);
			return "redirect:/";
		}
	}
	
	@GetMapping("/{expenseId}")
	public String index(Model model, @PathVariable("expenseId") Long expenseId) {
		Expense expense = expenseService.findExpense(expenseId);
		model.addAttribute("expense", expense);
		return "expense.jsp";
	}
	@RequestMapping("/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Expense expense = expenseService.findExpense(id);
        model.addAttribute("expense", expense);
        return "edit.jsp";
    }
    @RequestMapping(value="/expense/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("expense", expense);
            return "edit.jsp";
        } else {
            expenseService.updateExpense(expense);
            return "redirect:/";
        }
    }
    @DeleteMapping("/{id}/delete")
    public String deleteExpense(@PathVariable("id") Long id) {
    	expenseService.deleteExpense(id);
    	return "redirect:/";
    }
}
