package project.persistence.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import project.persistence.entities.Bet;
import project.persistence.entities.PendingBet;

import java.util.List;

/**
 * By extending the {@link JpaRepository} we have access to powerful methods.
 * For detailed information, see:
 * http://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/repository/CrudRepository.html
 * http://docs.spring.io/spring-data/data-commons/docs/1.6.1.RELEASE/reference/html/repositories.html
 *
 */


public interface PendingBetRepository extends JpaRepository<PendingBet, Long> {

    PendingBet save(PendingBet pendingBet);

    void delete(PendingBet pendingBet);

    @Query(value = "SELECT b FROM PendingBet b WHERE b.id = ?1")
    PendingBet findOne(Long id);

}
