class converter extends uvm_component;
  
  `uvm_component_utils(converter)
  
  seq_item xtn;
  
  uvm_blocking_get_port #(seq_item) conv_get_port;
  
  uvm_blocking_put_port #(seq_item) conv_put_port;
  
  function new(string name = "converter", uvm_component parent);
    super.new(name,parent);
    conv_get_port = new("conv_get_port",this);
    conv_put_port = new("conv_put_port",this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(5)
      begin
        conv_get_port.get(xtn);
        `uvm_info(get_name(),$sformatf("Converter: Value = %0d",xtn.value),UVM_NONE);
        #5;
        conv_put_port.put(xtn);
        #5;
      end
  endtask
  
endclass