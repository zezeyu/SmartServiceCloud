//
//  weakify.h
//  CXPK
//
//  Created by Tedzhou on 7/29/16.
//  Copyright © 2016 4c. All rights reserved.
//

#ifndef weakify_h
#define weakify_h
#include "stringify.h"

/*
 这里做的是 __weak typeof (self) self_weak_ = self;和__strong typeof (self) self = self_weak_;
 typeof 写在宏需要用__typeof__来代替, see: https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html#Alternate-Keywords
 */

#define weakify(VAR) \
__weak __typeof__(VAR) string_concat(VAR, _weak_) = (VAR)

/*
 用_Pragma是为了不让clang告警, 我们定义了个局部的self, shadow了全局的self;
 */

#define strongify(VAR) \
_Pragma("clang diagnostic push") \
_Pragma("clang dianostic ignore \"-Wshadow\"") \
__strong __typeof__(VAR) VAR = string_concat(VAR, _weak_) \
_Pragma("clang diagnostic pop")

#endif /* weakify_h */
