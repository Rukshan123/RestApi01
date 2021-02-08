package lk.wixis360.spring.Controller;


import lk.wixis360.spring.Dto.EmployeeDTO;
import lk.wixis360.spring.Service.EmployeeService;
import lk.wixis360.spring.Util.StandradResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/Employee")


@CrossOrigin
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;
    @GetMapping("/hi")
    public ModelAndView passParametersWithModelAndView() {
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("message", "Baeldung");
        return modelAndView;
    }

    @PostMapping(consumes = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity addEmployee(@RequestBody EmployeeDTO dto) {
        employeeService.saveEmployee(dto);
        StandradResponse response = new StandradResponse(200, "Success", null);
        return new ResponseEntity(response, HttpStatus.CREATED);

    }


    @DeleteMapping(params = {"id"})
    public ResponseEntity deleteEmployee(@RequestParam String id) {
        employeeService.deleteEmployee(id);
        return new ResponseEntity(new StandradResponse(200, "Success", null), HttpStatus.CREATED);
    }

    @PutMapping
    public ResponseEntity updateEmployee(@RequestBody EmployeeDTO dto) {
        employeeService.UpdateEmployee(dto);
        return new ResponseEntity(new StandradResponse(200, "Success", null), HttpStatus.OK);
    }

    @GetMapping(path = "/{id}")
    public ResponseEntity searchCustomer(@PathVariable String id) {
        EmployeeDTO employeeDTO = employeeService.searchEmployee(id);
        return new ResponseEntity(new StandradResponse(200, "Success", employeeDTO), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity getAllCustomers() {
        List<EmployeeDTO> allEmployee = employeeService.getAllEmployee();
        return new ResponseEntity(new StandradResponse(200, "Success", allEmployee), HttpStatus.OK);
    }


}
