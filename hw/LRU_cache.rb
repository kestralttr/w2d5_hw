class LRUCache
  def initialize(size)
    @size = size
    @ll = []
    @hshmp = {}
  end

  def count
    @ll.length
    # returns number of elements currently in cache
  end

  def add(el)
    if @ll.last.nil?
      next_val = nil
    else
      next_val = @ll.last
    end
    remove_old
    new_element = {el => {:prev => nil,:next => next_val}}
    @ll.last[@ll.last.first.first][:prev => new_element] unless @ll.empty?
    @ll << new_element
    @hshmp[el] = new_element
    # adds element to cache according to LRU principle
  end

  def show
    @ll
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!
  def remove_old
    if @ll.count >= 4
      @hshmp.delete(@ll.first)
      @ll.shift
    end
  end

end
