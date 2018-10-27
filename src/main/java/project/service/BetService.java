package project.service;

import project.persistence.entities.Bet;
import project.persistence.entities.User;
import project.persistence.entities.PendingBet;

import java.util.List;

/*
Service for both bet repository and pending bet repository
 */

public interface BetService {


    /**
     * Save a {@link PendingBet}
     * @param pendingBet {@link PendingBet} to be saved
     * @return {@link PendingBet} that was saved
     */
    void savePendingBet(PendingBet pendingBet);

    void savePendingBet(PendingBet pendingBet, User sender, User receiver);

    /**
     * Delete {@link PendingBet}
     * @param pendingBet {@link PendingBet} to be deleted
     */
    void deletePendingBet(PendingBet pendingBet);


    /**
     * Get all {@link PendingBet}s from a sender
     * @return A list of {@link PendingBet}s
     */
    List<PendingBet> findPendingBetBySender(String sender);


    /**
     * Get all {@link PendingBet}s from a receiver
     * @return A list of {@link PendingBet}s
     */
    List<PendingBet> findPendingBetByReceiver(String receiver);

    /**
     * Get one (@link PendingBet) from id
     * @param Id (@link PendingBet) to be found
     * @return one (@link PendingBet)
     */
    PendingBet findById(long Id);


    void deleteBet(Bet bet);

    List<Bet> findBetBySender(String sender);

    void saveBet(Bet bet);

    List<Bet> findBetByReceiver(String receiver);


    List<Bet> getActiveBets();

    List<Bet> getResolvedBets();
}
