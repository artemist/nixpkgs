#pragma once
#include_next <sys/stat.h>

// OpenBSD includes this through a long chain
#include <sys/types.h>

// Some programs rely on this, oh god
#include <time.h>
