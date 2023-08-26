package com.mattmottle.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.mattmottle.savetravels.models.Expense;
import com.mattmottle.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository; 
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}

	// Create an expense
	public Expense createExpense(Expense newExpense) {
		return expenseRepository.save(newExpense);
	}
	
	// Read all expense
	public List<Expense> readAllExpenses() {
		return expenseRepository.findAll();
	}
	// Read one expense
	public Expense findExpense(Long id) {
        Optional<Expense> optionalExpense = expenseRepository.findById(id);
        if(optionalExpense.isPresent()) {
            return optionalExpense.get();
        } else {
            return null;
        }
    }
	//update burger
	public Expense updateExpense(Expense updatedExpense) {
		return expenseRepository.save(updatedExpense);
}
//	  deletes burger
    public void deleteExpense(Long id) {
		expenseRepository.deleteById(id);	
	}	
    
}
