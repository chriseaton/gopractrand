//typical for 32 and 64 bit compiler targets
typedef unsigned char          Uint8;
typedef unsigned short int     Uint16;
typedef unsigned int           Uint32;
typedef unsigned long long int Uint64;
typedef signed char          Sint8;
typedef signed short int     Sint16;
typedef signed int           Sint32;
typedef signed long long int Sint64;

//double-checking those integer sizes:
typedef char _compiletime_assert_uint8_size [(sizeof(Uint8 )==1) ? 1 : -1];
typedef char _compiletime_assert_uint16_size[(sizeof(Uint16)==2) ? 1 : -1];
typedef char _compiletime_assert_uint32_size[(sizeof(Uint32)==4) ? 1 : -1];
typedef char _compiletime_assert_uint64_size[(sizeof(Uint64)==8) ? 1 : -1];
typedef char _compiletime_assert_sint8_size [(sizeof(Sint8 )==1) ? 1 : -1];
typedef char _compiletime_assert_sint16_size[(sizeof(Sint16)==2) ? 1 : -1];
typedef char _compiletime_assert_sint32_size[(sizeof(Sint32)==4) ? 1 : -1];
typedef char _compiletime_assert_sint64_size[(sizeof(Sint64)==8) ? 1 : -1];