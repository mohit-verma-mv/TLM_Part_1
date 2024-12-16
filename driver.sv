class driver extends uvm_component;
  
  `uvm_component_utils(driver)
  
  seq_item xtn;
  
  uvm_blocking_get_port #(seq_item) drv_get_port;
  
  function new(string name = "driver", uvm_component parent);
    super.new(name,parent);
    drv_get_port = new("drv_get_port",this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(5)
      begin
        #5;
        drv_get_port.get(xtn);
        `uvm_info(get_name(),$sformatf("Driver: Value = %0d",xtn.value),UVM_NONE);
      end
  endtask
  
endclass