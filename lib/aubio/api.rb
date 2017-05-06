require 'ffi'

module Aubio
  module Api #:nodoc
    extend FFI::Library
    # idea inspired by https://github.com/qoobaa/magic/blob/master/lib/magic/api.rb
    lib_paths = Array(ENV["AUBIO_LIB"] || Dir["/{opt,usr}/{,local/}{lib,lib64,Cellar/aubio**}/libaubio.{*.dylib,so.*}"])
    fallback_names = %w(libaubio.4.2.2.dylib libaubio.so.1 aubio1.dll)
    ffi_lib(lib_paths + fallback_names)


    # onset
    attach_function :new_aubio_onset, [:string, :int, :int, :int], :pointer
    attach_function :aubio_onset_do, [:pointer, :pointer, :pointer], :void
    attach_function :aubio_onset_get_last, [:pointer], :int
    attach_function :aubio_onset_get_last_s, [:pointer], :float
    attach_function :aubio_onset_get_last_ms, [:pointer], :float
    attach_function :aubio_onset_set_silence, [:pointer, :float], :int
    attach_function :aubio_onset_get_silence, [:pointer], :float
    attach_function :aubio_onset_get_descriptor, [:pointer], :float
    attach_function :aubio_onset_get_thresholded_descriptor, [:pointer], :float
    attach_function :aubio_onset_set_threshold, [:pointer, :float], :int
    attach_function :aubio_onset_set_minioi, [:pointer, :int], :int
    attach_function :aubio_onset_set_minioi_s, [:pointer, :int], :int
    attach_function :aubio_onset_set_minioi_ms, [:pointer, :float], :int
    attach_function :aubio_onset_set_delay, [:pointer, :int], :int
    attach_function :aubio_onset_set_delay_s, [:pointer, :int], :int
    attach_function :aubio_onset_set_delay_ms, [:pointer, :float], :int
    attach_function :aubio_onset_get_minioi, [:pointer], :int
    attach_function :aubio_onset_get_minioi_s, [:pointer], :float
    attach_function :aubio_onset_get_minioi_ms, [:pointer], :float
    attach_function :aubio_onset_get_delay, [:pointer], :int
    attach_function :aubio_onset_get_delay_s, [:pointer], :float
    attach_function :aubio_onset_get_delay_ms, [:pointer], :float
    attach_function :aubio_onset_get_threshold, [:pointer], :float
    attach_function :del_aubio_onset, [:pointer], :void

    # pitch
    attach_function :new_aubio_pitch, [:string, :int, :int, :int], :pointer
    attach_function :aubio_pitch_do, [:pointer, :pointer, :pointer], :void
    attach_function :aubio_pitch_set_tolerance, [:pointer, :int], :int
    attach_function :aubio_pitch_set_unit, [:pointer, :string], :int
    attach_function :aubio_pitch_set_silence, [:pointer, :float], :int
    attach_function :aubio_pitch_get_silence, [:pointer], :float
    attach_function :aubio_pitch_get_confidence, [:pointer], :float
    attach_function :del_aubio_pitch, [:pointer], :void

  end
end
