require 'test_helper'

class AubioTest < Minitest::Test
  def setup
    @loop_amen_path = File.expand_path("../sounds/loop_amen.wav", __FILE__)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Aubio::VERSION
  end

  def test_it_checks_file_existence
    assert_raises Aubio::FileNotFound do
      result = Aubio.open(@loop_amen_path + "e")
    end
  end

  def test_it_checks_file_is_readable_audio
    assert_raises Aubio::InvalidAudioInput do
      Aubio.open("/Users/xriley/Projects/aubio/Gemfile")
    end
  end

  def test_it_checks_if_file_has_been_closed
    source = Aubio.open(@loop_amen_path)
    source.close
    assert_raises Aubio::AlreadyClosed do
      source.onsets
    end
  end

  def test_it_calculates_onsets
    result = Aubio.open(@loop_amen_path).onsets.first(10)
    assert_equal [
      {:s=>0.0, :ms=>0.0},
      {:s=>0.21174603700637817, :ms=>211.74603271484375},
      {:s=>0.4404761791229248, :ms=>440.4761657714844},
      {:s=>0.6651020646095276, :ms=>665.10205078125},
      {:s=>0.795714259147644, :ms=>795.7142333984375},
      {:s=>0.8873015642166138, :ms=>887.3015747070312},
      {:s=>0.9989795684814453, :ms=>998.9795532226562},
      {:s=>1.0950794219970703, :ms=>1095.0794677734375},
      {:s=>1.3104535341262817, :ms=>1310.4534912109375},
      {:s=>1.5354194641113281, :ms=>1535.41943359375}
    ], result
  end
end
