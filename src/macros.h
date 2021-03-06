#ifndef MACROS_H
#define MACROS_H

#include <string.h>

int errors_no = 0;

typedef int bool;
enum { false, true };

/* <------- SYNTACTICAL ANALYSIS CONSTS -------> */
#define VProgram 1
#define VDecls 2
#define VDecl 3
#define VVars 4
#define VType 5
#define VStmts 6
#define VStmt 7
#define VSimp 8
#define VControl 9
#define VAsopExp 10
#define VExp 11
#define VBlock 12
#define VElseBlock 13
#define VUnopExp 14
#define VBinopExp 15
#define VBinop1 16
#define VBinop2 17

#define AssigEQ 18
#define AssigPLE 19
#define AssigMNE 20
#define AssigMLE 21
#define AssigSBE 22
#define AssigMDE 23

#define BiPLUS 24
#define BiMINUS 25
#define BiMULT 26
#define BiDIV 27
#define BiMOD 28
#define BiLS 29
#define BiLE 30
#define BiGT 31
#define BiGE 32
#define BiEQ 33
#define BiNE 34
#define BiAND 35
#define BiOR 36

#define OpNOT 37
#define OpNEG 38

#define VFactor 39

#define TYPEVARIABLE 40
#define TYPECONSTANT 41
#define TYPEINT 42
#define TYPEOPERATOR 43

#define VIF 44
#define VWHILE 45
#define VFOR 46
#define VBREAK 47
#define VCONTINUE 48

#define VPRINT 49
#define VIfStmt 50
#define VError 51
#define VBinop3 52
#define VBinop4 53

char* macro_to_string(int macro) {
  char* err;
  char* out;

  switch (macro) {
    case 1: return "VProgram";
    case 2: return "VDecls";
    case 3: return "VDecl";
    case 4: return "VVars";
    case 5: return "VType";
    case 6: return "VStmts";
    case 7: return "VStmt";
    case 8: return "VSimp";
    case 9: return "VControl";
    case 10: return "VAsopExp";
    case 11: return "VExp";
    case 12: return "VBlock";
    case 13: return "VElseBlock";
    case 14: return "VUnopExp";
    case 15: return "VBinopExp";
    case 16: return "VBinop1";
    case 17: return "VBinop2";

    case 18: return "AssigEQ";
    case 19: return "AssigPLE";
    case 20: return "AssigMNE";
    case 21: return "AssigMLE";
    case 22: return "AssigSBE";
    case 23: return "AssigMDE";

    case 24: return "BiPLUS";
    case 25: return "BiMINUS";
    case 26: return "BiMULT";
    case 27: return "BiDIV";
    case 28: return "BiMOD";
    case 29: return "BiLS";
    case 30: return "BiLE";
    case 31: return "BiGT";
    case 32: return "BiGE";
    case 33: return "BiEQ";
    case 34: return "BiNE";
    case 35: return "BiAND";
    case 36: return "BiOR";

    case 37: return "OpNOT";
    case 38: return "OpNEG";

    case 39: return "VFactor";

    case 44: return "VIF";
    case 45: return "VWHILE";
    case 46: return "VFOR";
    case 47: return "VBREAK";
    case 48: return "VCONTINUE";

    case 49: return "VPRINT";
    case 50: return "VIfStmt";
    case 51: return "VError";

    case 52: return "VBinop3";
    case 53: return "VBinop4";

    default:
              err = malloc(snprintf( NULL, 0, "%d", macro) + 1);
              snprintf(err, snprintf( NULL, 0, "%d", macro) + 1, "%d", macro);
              out = malloc(sizeof("Undefined ") + sizeof(err) + 1);
              strcat(out, "Undefined ");
              strcat(out, err);
              free(err);
              return out;
  }
}

bool isAssignOperator(int op) {
  switch (op) {
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
      return true;
  }
  return false;
}

bool isBinaryOperator(int op) {
  switch (op) {
    case BiPLUS:
    case BiMINUS:
    case BiMULT:
    case BiDIV:
    case BiMOD:
    case BiLS:
    case BiLE:
    case BiGT:
    case BiGE:
    case BiEQ:
    case BiNE:
    case BiAND:
    case BiOR:
      return true;
  }
  return false;
}

bool isUnOperator(int op) {
  switch (op) {
    case 37:
    case 38:
      return true;
  }
  return false;
}

bool isControlOperator(int op) {
  switch (op) {
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
      return true;
  }
  return false;
}

#endif
