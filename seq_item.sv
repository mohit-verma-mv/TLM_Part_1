class seq_item extends uvm_sequence_item;
  
  rand bit [3:0] value;
  
  `uvm_object_utils(seq_item)
  
  function new(string name = "seq_item");
    super.new(name);
  endfunction
  
  constraint val_c {value > 0;}

endclass