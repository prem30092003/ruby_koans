require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    assert_equal __(true), 1.is_a?(Object)
    assert_equal __(true), 1.5.is_a?(Object)
    assert_equal __(true), "string".is_a?(Object)
    assert_equal __(true), nil.is_a?(Object)
    assert_equal __(true), Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal __("123"), 123.to_s
    assert_equal __(""), nil.to_s
  end

  def test_objects_can_be_inspected
    assert_equal __("123"), 123.inspect
    assert_equal __("nil"), nil.inspect
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal Integer, obj.object_id.class
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert_equal __(true), obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal __(1), 0.object_id
    assert_equal __(3), 1.object_id
    assert_equal __(5), 2.object_id
    assert_equal __(201), 100.object_id

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal __(true), obj           != copy
    assert_equal __(true), obj.object_id != copy.object_id
  end
end
