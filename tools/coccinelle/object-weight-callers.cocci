// Transitional call boundaries: existing callers still hold word pointers.
// A cast expression does not match the identifier rule again.
@call@
identifier object;
typedef uw_object_hdr_t;
@@
- calculate_object_weight(object)
+ calculate_object_weight((uw_object_hdr_t *)object)
