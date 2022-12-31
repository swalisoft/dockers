<?php

class TestClass {
  protected $name = 'Carlos You are the bear';

  function getName() {
    return $this->name;
  }
}

$obj = new TestClass();

echo $obj->getName();