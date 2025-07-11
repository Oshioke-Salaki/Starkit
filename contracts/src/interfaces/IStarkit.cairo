use starkit::base::types::{Entry, Habit, RecentLog};
use starknet::ContractAddress;
#[starknet::interface]
pub trait IStarkit<TContractState> {
    /// Sets a unique username for the caller's wallet address.
    fn set_user_name(ref self: TContractState, name: felt252);

    /// Creates a new habit for the caller.
    fn create_habit(ref self: TContractState, infoUid: ByteArray) -> u32;

    /// Logs an entry for a specific habit.
    fn log_entry(ref self: TContractState, habit_id: u32, log_info: ByteArray);

    fn get_user_habits(self: @TContractState, user: ContractAddress) -> Array<Habit>;

    /// Retrieves the list of habit IDs owned by a user.
    fn get_user_habits_ids(self: @TContractState, user: ContractAddress) -> Array<u32>;

    /// Retrieves a paginated list of log entries for a habit.
    fn get_habit_logs(self: @TContractState, habit_id: u32, start: u32, count: u32) -> Array<Entry>;

    /// Retrieves the current streak count for a habit.
    fn get_streak(self: @TContractState, habit_id: u32) -> u32;
    fn get_user_longest_streak(self: @TContractState, user: ContractAddress) -> u32;

    /// Retrieves the username associated with a wallet address.
    fn get_user_name(self: @TContractState, wallet: ContractAddress) -> felt252;

    /// Retrieves the wallet address associated with a username.
    fn get_wallet_from_user_name(self: @TContractState, user_name: felt252) -> ContractAddress;

    /// Retrieves the total number of habits created.
    fn get_total_habit_count(self: @TContractState) -> u32;

    /// Retrieves the total number of logs for a specific habit.
    fn get_habit_log_count(self: @TContractState, habit_id: u32) -> u32;

    fn get_total_logs_user(self: @TContractState, user: ContractAddress) -> u32;
    fn get_total_user_habits(self: @TContractState, user: ContractAddress) -> u32;
    fn get_platform_longest_streaks(self: @TContractState) -> Array<Habit>;
    fn get_recent_logs(self: @TContractState) -> Array<RecentLog>;
}
