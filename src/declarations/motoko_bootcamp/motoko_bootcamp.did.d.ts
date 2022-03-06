import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'add' : (arg_0: bigint, arg_1: bigint) => Promise<bigint>,
  'clear_counter' : () => Promise<undefined>,
  'days_to_seconds' : (arg_0: bigint) => Promise<bigint>,
  'divide' : (arg_0: bigint, arg_1: bigint) => Promise<boolean>,
  'greet' : (arg_0: string) => Promise<string>,
  'increment_counter' : (arg_0: bigint) => Promise<bigint>,
  'is_even' : (arg_0: bigint) => Promise<boolean>,
  'square' : (arg_0: bigint) => Promise<bigint>,
}
