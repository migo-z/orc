# This file is the top android makefile for all sub-modules.

LOCAL_PATH := $(call my-dir)

ORC_TOP := $(LOCAL_PATH)

ORC_BUILD_STATIC := $(BUILD_STATIC)

ORC_MAJORMINOR := 0.4
ORC_CPU := arm
ORC_ENABLE_BACKEND_ARM := true
ORC_ENABLE_BACKEND_NEON := true
ORC_ENABLE_BACKEND_MMX := false
ORC_ENABLE_BACKEND_SSE := false
ORC_ENABLE_BACKEND_C64X := false

ORC_C_INCLUDES :=				\
	$(ORC_TOP)				\
	$(ORC_TOP)/android			\
	$(ORC_TOP)/orc

ifeq ($(ORC_BUILD_STATIC),true)
ORC_STATIC_LIBRARIES :=				\
	liborc-$(ORC_MAJORMINOR)		\
	liborc-test-$(ORC_MAJORMINOR)
else
ORC_SHARED_LIBRARIES :=				\
	liborc-$(ORC_MAJORMINOR)		\
	liborc-test-$(ORC_MAJORMINOR)
endif

include $(CLEAR_VARS)

include $(ORC_TOP)/orc/Android.mk
include $(ORC_TOP)/orc-test/Android.mk
#include $(ORC_TOP)/tools/Android.mk

