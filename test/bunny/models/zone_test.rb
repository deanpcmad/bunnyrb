require "test_helper"

class ZoneTest < Minitest::Test

  def test_zone_list
    zones = Bunny::Zone.list
    assert_equal Bunny::Collection, zones.class
    assert_equal Bunny::Zone, zones.data.first.class
  end

  def test_zone_create
    zone = Bunny::Zone.create(name: "deanpcmad1.test")

    assert_equal Bunny::Zone, zone.class
    assert_equal "deanpcmad1.test", zone.domain
  end

  def test_zone_retrieve
    zone = Bunny::Zone.retrieve(id: 217249)
    assert_equal Bunny::Zone, zone.class
    assert_equal 217249, zone.id
    assert_equal "deanpcmad.test", zone.domain
  end

  def test_zone_update
    zone = Bunny::Zone.update(id: 217249, LoggingEnabled: true)

    assert_equal Bunny::Zone, zone.class
    assert zone.logging_enabled
  end

  def test_zone_delete
    zone = Bunny::Zone.delete(id: 217250)

    assert zone
  end

  def test_zone_check_availability
    zone = Bunny::Zone.check_availability(name: "deanpcmad.test")

    assert zone
  end

  def test_zone_create_record
    record = Bunny::Zone.create_record zone: 217249, type: "A", value: "1.1.1.1", name: "test2"

    assert_equal Bunny::Record, record.class
    assert_equal "1.1.1.1", record.value
  end

  def test_zone_update_record
    record = Bunny::Zone.update_record zone: 217249, record: 3992424, value: "1.0.0.1"

    assert record
  end

  def test_zone_delete_record
    record = Bunny::Zone.delete_record zone: 217249, record: 3992424

    assert record
  end

end
